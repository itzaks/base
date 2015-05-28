keystone = require 'keystone'
Types    = keystone.Field.Types
User     = new keystone.List 'User',
  autokey: { from: 'name', path: 'key', unique: yes }

User.add(
  canAccessKeystone: { type: Boolean, initial: true }
  name: { type: String, required: true }
  email: { type: Types.Email, initial: true, required: true, index: true }
  password: { type: Types.Password, initial: true }
)

User.register()
