keystone = require 'keystone'
Types = keystone.Field.Types
Copy = new keystone.List 'Copy',
  map: {name: 'language'}
  plural: 'Copy'
  nocreate: true
  nodelete: true

Copy.add
  language: { type: Types.Select, options: ['svenska', 'engelska'], unique: true, initial: true, noedit: true }
  title: { type: Types.Markdown }

Copy.register()
