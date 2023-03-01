migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("qrblponcrr4apb3");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "qrblponcrr4apb3",
    "created": "2023-01-21 12:02:04.273Z",
    "updated": "2023-01-21 12:02:04.273Z",
    "name": "question",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "h1ovf6fi",
        "name": "question",
        "type": "text",
        "required": true,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "kmtlspvh",
        "name": "answer",
        "type": "text",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "byrowpot",
        "name": "difficaulty",
        "type": "number",
        "required": false,
        "unique": false,
        "options": {
          "min": 0,
          "max": 2
        }
      }
    ],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
})
