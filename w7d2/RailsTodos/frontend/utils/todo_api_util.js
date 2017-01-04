export const getTodos = () => {
  return ($.ajax({
      method: 'GET',
      url: 'api/todos',
    }));
};
