migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("i0yi4ehtzc6lds6")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "lqirkdar",
    "name": "correctAnswer",
    "type": "number",
    "required": false,
    "unique": false,
    "options": {
      "min": 1,
      "max": 4
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("i0yi4ehtzc6lds6")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "lqirkdar",
    "name": "correct_answer",
    "type": "number",
    "required": false,
    "unique": false,
    "options": {
      "min": 1,
      "max": 4
    }
  }))

  return dao.saveCollection(collection)
})
