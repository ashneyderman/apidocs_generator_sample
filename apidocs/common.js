 /**
 * @apiDefine BadRequest
 * @apiError BadRequest generic bad request error
 * @apiErrorExample {curl} BadRequest:
 * HTTP/1.1 400 Bad Request
 * Content-Type: application/json; charset=utf-8
 *
 * {
 *  "resp_type":"error",
 *  "error":"BadRequest",
 *  "details":{
 *    "message":"message detailing the error"
 *  }
 * }
 */