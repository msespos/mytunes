# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{ name: 'm:ke', project_name: 'blanket forts',
               location: 'Lomita, CA', favorite_artist: 'Autechre',
               birthday: '1975-08-07', :email => 'mike@example.com',
               password: '123456', password_confirmation: '123456'},
             { name: 'Sean', project_name: 'Autechre',
               location: 'England', favorite_artist: 'Coil',
               birthday: '1972-01-01', :email => 'sean@example.com',
               password: '123456', password_confirmation: '123456'},
             { name: 'Rob', project_name: 'Autechre',
               location: 'England', favorite_artist: 'Depeche Mode',
               birthday: '1973-04-04', :email => 'rob@example.com',
               password: '123456', password_confirmation: '123456'},
             { name: 'Richard', project_name: 'Aphex Twin',
               location: 'England', favorite_artist: 'Aphex Twin',
               birthday: '1971-08-18', :email => 'richard@example.com',
               password: '123456', password_confirmation: '123456'},
             { name: 'David Lee Roth', project_name: 'Van Halen',
               location: 'California', favorite_artist: 'Frank Sinatra',
               birthday: '1955-05-25', :email => 'david@example.com',
               password: '123456', password_confirmation: '123456'},
             { name: 'Joanna Newsom', project_name: 'Joanna Newsom',
               location: 'California', favorite_artist: 'Joni Mitchell',
               birthday: '1980-02-14', :email => 'joanna@example.com',
               password: '123456', password_confirmation: '123456'},
             { name: 'Polly', project_name: 'PJ Harvey',
               location: 'England', favorite_artist: 'Nick Cave',
               birthday: '1968-02-03', :email => 'polly@example.com',
               password: '123456', password_confirmation: '123456'}])
