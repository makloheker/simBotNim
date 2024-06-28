# hasil perkawinan python, ada, dan modula.
# threesome anjir wkwokwok

import json, httpclient

proc mainLoop(client: HttpClient) =
  while true:
    write(stdout, "you>: ")
    let inputText: string = readLine(stdin)

    let body = "text=" & inputText & "&lc=id"

    let response = client.request("https://api.simsimi.vn/v1/simtalk", httpMethod = HttpPost, body = $body)

    if response.code == Http200:
      let jsonResponse = response.body.parseJson()
      if jsonResponse.hasKey("message"):
        let message = jsonResponse["message"].getStr()
        echo "bot>: " , message
    else:
      echo "failed to get response:>"

let client = newHttpClient()
client.headers = newHttpHeaders({ "Content-Type": "application/x-www-form-urlencoded" })

mainLoop(client)
