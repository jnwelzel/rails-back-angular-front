@app.factory 'Post', ['$resource', ($resource) ->
  res = $resource('/api/posts/:id', {id: '@id'})
]