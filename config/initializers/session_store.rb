# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_db_copy_session',
  :secret      => '5a34d968a8b8d72d4a8e3b8845dfecbdfbeb55b16c87d46a8d9090d1ca37c9e92ca0197726efde0b7014f4e1a33ee7b9aa081e7d206b72b601915175f1a085fe'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
