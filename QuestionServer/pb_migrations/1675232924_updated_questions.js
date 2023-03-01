migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("i0yi4ehtzc6lds6")

  collection.viewRule = ""

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("i0yi4ehtzc6lds6")

  collection.viewRule = null

  return dao.saveCollection(collection)
})
