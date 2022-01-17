const Router = require('express')
const router = new Router()
const controller = require('../controller/controller');

router.get('/user', controller.getApi)
router.get('/user/:id', controller.getOneApi)
router.post("/user", controller.postApi);
router.put("/user/:id", controller.updateApi);
router.delete("/user/:id", controller.deleteApi);


module.exports = router; 