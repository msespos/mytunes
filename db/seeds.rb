# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Devise::Mailer.perform_deliveries = false

User.create!([{ name: 'm:ke', project_name: 'blanket forts',
                location: 'Lomita, CA', favorite_artist: 'Autechre',
                birthday: '1975-08-07', email: 'mike@example.com',
                password: '123456', password_confirmation: '123456' },
              { name: 'Sean', project_name: 'Autechre',
                location: 'England', favorite_artist: 'Coil',
                birthday: '1972-01-01', email: 'sean@example.com',
                password: '123456', password_confirmation: '123456' },
              { name: 'Rob', project_name: 'Autechre',
                location: 'England', favorite_artist: 'Depeche Mode',
                birthday: '1973-04-04', email: 'rob@example.com',
                password: '123456', password_confirmation: '123456' },
              { name: 'Richard', project_name: 'Aphex Twin',
                location: 'England', favorite_artist: 'Aphex Twin',
                birthday: '1971-08-18', email: 'richard@example.com',
                password: '123456', password_confirmation: '123456' },
              { name: 'David Lee Roth', project_name: 'Van Halen',
                location: 'California', favorite_artist: 'Frank Sinatra',
                birthday: '1955-05-25', email: 'david@example.com',
                password: '123456', password_confirmation: '123456' },
              { name: 'Joanna Newsom', project_name: 'Joanna Newsom',
                location: 'California', favorite_artist: 'Joni Mitchell',
                birthday: '1980-02-14', email: 'joanna@example.com',
                password: '123456', password_confirmation: '123456' },
              { name: 'Polly', project_name: 'PJ Harvey',
                location: 'England', favorite_artist: 'Nick Cave',
                birthday: '1968-02-03', email: 'polly@example.com',
                password: '123456', password_confirmation: '123456' },
              { name: 'Dad', project_name: 'Evans Ave.',
                location: 'Bedford', favorite_artist: 'Van Morrison',
                birthday: '1947-12-04', email: 'dad@example.com',
                password: '123456', password_confirmation: '123456' },
              { name: 'Mom', project_name: 'Evans Ave.',
                location: 'Bedford', favorite_artist: 'Rolling Stones',
                birthday: '1947-06-01', email: 'mom@example.com',
                password: '123456', password_confirmation: '123456' },
              { name: 'Katie', project_name: 'Xena',
                location: 'Toluca Lake', favorite_artist: 'Xena',
                birthday: '1978-02-16', email: 'katie@example.com',
                password: '123456', password_confirmation: '123456' },
              { name: 'Alice', project_name: 'Xena',
                location: 'England', favorite_artist: 'Xena',
                birthday: '1978-05-29', email: 'alice@example.com',
                password: '123456', password_confirmation: '123456' }])

TextPost.create!([{ user_id: 1, body: 'Happy New Year!' },
                  { user_id: 2, body: 'Basscadet rocks!' },
                  { user_id: 3, body: 'I love Depeche Mode!' },
                  { user_id: 1, body: 'Everybody have fun tonight' },
                  { user_id: 2, body: "How's your app coming along Mike?" },
                  { user_id: 3, body: "I've been using Max/MSP a lot lately" },
                  { user_id: 4, body: 'My new album is out any month now' },
                  { user_id: 5, body: 'Jump!' },
                  { user_id: 6, body: "I promise I'll come out with another album soon" }])

Friendship.create!([{ requesting_user_id: 1, requested_user_id: 2, confirmed: true },
                    { requesting_user_id: 1, requested_user_id: 3, confirmed: true },
                    { requesting_user_id: 2, requested_user_id: 3, confirmed: true },
                    { requesting_user_id: 4, requested_user_id: 5, confirmed: true },
                    { requesting_user_id: 5, requested_user_id: 6, confirmed: true },
                    { requesting_user_id: 6, requested_user_id: 6, confirmed: true },
                    { requesting_user_id: 1, requested_user_id: 4, confirmed: true },
                    { requesting_user_id: 1, requested_user_id: 5, confirmed: true },
                    { requesting_user_id: 1, requested_user_id: 6, confirmed: true }])

Like.create!([{ post_id: 1, user_id: 2, post_type: 'TextPost' },
              { post_id: 1, user_id: 3, post_type: 'TextPost' },
              { post_id: 1, user_id: 4, post_type: 'TextPost' },
              { post_id: 1, user_id: 5, post_type: 'TextPost' },
              { post_id: 1, user_id: 6, post_type: 'TextPost' },
              { post_id: 2, user_id: 3, post_type: 'TextPost' },
              { post_id: 2, user_id: 1, post_type: 'TextPost' },
              { post_id: 8, user_id: 1, post_type: 'TextPost' },
              { post_id: 8, user_id: 5, post_type: 'TextPost' },
              { post_id: 8, user_id: 6, post_type: 'TextPost' }])

Comment.create!([{ post_id: 1, user_id: 2, post_type: 'TextPost',
                   body: 'YAY!' },
                 { post_id: 1, user_id: 3, post_type: 'TextPost',
                   body: 'Hooray for 2022!' },
                 { post_id: 1, user_id: 4, post_type: 'TextPost',
                   body: 'Super!' },
                 { post_id: 1, user_id: 5, post_type: 'TextPost',
                   body: 'Jump!' },
                 { post_id: 1, user_id: 6, post_type: 'TextPost',
                   body: 'Fantastic!' },
                 { post_id: 5, user_id: 1, post_type: 'TextPost',
                   body: "You know, it's fine" },
                 { post_id: 5, user_id: 2, post_type: 'TextPost',
                   body: "I bet it's great!" },
                 { post_id: 5, user_id: 3, post_type: 'TextPost',
                   body: 'Keep it up!' },
                 { post_id: 9, user_id: 1, post_type: 'TextPost',
                   body: 'I sure hope so!' }])

Devise::Mailer.perform_deliveries = true
