const produce = require("./src/producer")
const consume = require("./src/consumer")

produce().catch((err) => {
	console.error("error in producer: ", err)
})

consume().catch((err) => {
	console.error("error in consumer: ", err)
})