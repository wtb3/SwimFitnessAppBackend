# db/seeds.rb

# Create Users
User.create(
  name: "John Doe",
  email: "john@example.com",
  password_digest: BCrypt::Password.create("password"), # Hashed password
  image_url: "https://example.com/john.jpg",
)

User.create(
  name: "Jane Smith",
  email: "jane@example.com",
  password_digest: BCrypt::Password.create("password"), # Hashed password
  image_url: "https://example.com/jane.jpg",
)

# Create Exercises
Exercise.create(
  name: "Push-up",
  description: "A basic upper body exercise.",
  image_url: "https://example.com/pushup.jpg",
  video_url: "https://www.youtube.com/watch?v=IODxDxX7oi4",
)

Exercise.create(
  name: "Squats",
  description: "Lower body workout targeting thighs and glutes.",
  image_url: "https://example.com/squats.jpg",
  video_url: "https://www.youtube.com/watch?v=QKKZ9AGYTi4",
)

# Create Routines
Routine.create(
  user_id: User.first.id,
  exercise_id: Exercise.first.id,
  reps: 15,
)

Routine.create(
  user_id: User.last.id,
  exercise_id: Exercise.last.id,
  reps: 20,
)
