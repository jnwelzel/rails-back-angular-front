@app.factory 'Post', ['$resource', ($resource) ->
  res = $resource('/api/posts/:id', {id: '@id'})
]

@app.factory 'httpInterceptor', ['$q', ($q) ->
  {
    'responseError': (rejection) ->
      console.log 'Error response intercepted!'
      # handle error
      $q.reject rejection
  }
]