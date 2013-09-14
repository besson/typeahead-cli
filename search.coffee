request = require "request"
JSONStream = require "JSONStream"
es = require "event-stream"
http = require "http"
qs = require 'querystring'

search = (query) ->

  query_params = qs.stringify({ q: "title:#{query}", fl: "title", rows: "10", wt: "json"})

  options = {
    host: "localhost",
    port: 8983,
    path: "/solr/c2_mp3/select?#{query_params}",
    method: "GET"
  }

  time_parser = JSONStream.parse 'responseHeader.QTime'
  title_parser = JSONStream.parse 'response.docs.*.title'


  if query.length > 1
    console.log("/solr/c2_mp3/select?q=title:#{query}&fl=title&rows=10&wt=json")

    http.get options, (res) ->
      res.pipe(time_parser).pipe(es.mapSync((data) ->
        console.log("time: #{data} ms")
      ))

      res.pipe(title_parser).pipe(es.mapSync((data) ->
        console.log(data)
      ))

module.exports = search
