migrate((db) => {
  const collection = new Collection({
    "id": "i0yi4ehtzc6lds6",
    "created": "2023-01-21 12:07:57.631Z",
    "updated": "2023-01-21 12:07:57.631Z",
    "name": "questions",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "mwwvav1l",
        "name": "question",
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
        "id": "p4hdccfo",
        "name": "answer1",
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
        "id": "3jhbui8g",
        "name": "answer2",
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
        "id": "s8gx3mix",
        "name": "answer3",
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
        "id": "vukrfhpv",
        "name": "answer4",
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
        "id": "tn5eb3cq",
        "name": "number",
        "type": "number",
        "required": false,
        "unique": false,
        "options": {
          "min": 0,
          "max": 100
        }
      },
      {
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
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("i0yi4ehtzc6lds6");

  return dao.deleteCollection(collection);
})
