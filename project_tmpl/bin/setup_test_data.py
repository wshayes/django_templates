# setup_test_data.py
# From https://mattsegal.dev/django-factoryboy-dummy-data.html

# Run this via `.manage.py setup_test_data`
# Put this in your project's apps/app1/management/commands/setup_test_data.py directory

import random

from django.core.management.base import BaseCommand
from django.db import transaction
from forum.factories import ClubFactory, CommentFactory, ThreadFactory, UserFactory
from forum.models import Club, Comment, Thread, User

NUM_USERS = 50
NUM_CLUBS = 10
NUM_THREADS = 12
COMMENTS_PER_THREAD = 25
USERS_PER_CLUB = 8


class Command(BaseCommand):
    help = "Generates test data"

    @transaction.atomic
    def handle(self, *args, **kwargs):
        self.stdout.write("Deleting old data...")
        models = [User, Thread, Comment, Club]
        for m in models:
            m.objects.all().delete()

        self.stdout.write("Creating new data...")
        # Create all the users
        people = []
        for _ in range(NUM_USERS):
            person = UserFactory()
            people.append(person)

        # Add some users to clubs
        for _ in range(NUM_CLUBS):
            club = ClubFactory()
            members = random.choices(people, k=USERS_PER_CLUB)
            club.user.add(*members)

        # Create all the threads
        for _ in range(NUM_THREADS):
            creator = random.choice(people)
            thread = ThreadFactory(creator=creator)
            # Create comments for each thread
            for _ in range(COMMENTS_PER_THREAD):
                commentor = random.choice(people)
                CommentFactory(user=commentor, thread=thread)
