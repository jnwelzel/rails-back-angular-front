@app.factory 'Post', ['$resource', ($resource) ->
  PostResource = $resource('/api/posts/:id', {id: '@id'})

  save: (post) ->
    response = new PostResource(post).$save()
    response.then (result) ->
      result

  all: ->
    PostResource.query()
]

@app.factory 'httpInterceptor', ['$q', ($q) ->
  {
    'responseError': (rejection) ->
      # handle error
      msg = '(' + rejection.status + ' ' + rejection.statusText + ')'
      angular.element(showMessage('Something went wrong ' + msg, 'error'))
      $q.reject rejection
  }
]