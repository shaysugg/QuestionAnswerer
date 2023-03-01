migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("i0yi4ehtzc6lds6")

  collection.listRule = ""

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("i0yi4ehtzc6lds6")

  collection.listRule = null

  return dao.saveCollection(collection)
})
