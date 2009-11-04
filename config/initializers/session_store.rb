# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_idealise_session',
  :secret      => '5948d5e015e099e8be453377313c04eed6999ef4de9269b5aa6e196ef9fdbde7a616cab68bb7c7762f90f927ce5f2a9638b10687160c134f390634ea5dfcec35'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
