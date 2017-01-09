export const fetchPosts = (post) => (
  $.ajax({
    method: 'GET',
    url: `api/posts`,
    data: post
  })
);

export const fetchPost = (post) => (
  $.ajax({
    method: 'GET',
    url: `api/posts/${post}`
  })
);

export const createPost = (post) => (
  $.ajax({
    method: 'POST',
    url: 'api/posts',
    data: { post }
  })
)

export const updatePost = (post) => (
  $.ajax({
    method: 'PATCH',
    url: `api/posts/${post.id}`,
    data: { post }
  })
)

export const deletePost = (id) => (
  $.ajax({
    method: 'DELETE',
    url: `api/posts/${id}`,
  })
)
