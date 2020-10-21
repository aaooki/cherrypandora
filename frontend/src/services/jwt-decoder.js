export default {
  payload() {
    let jwt_token = localStorage.getItem('token');
    if (jwt_token === null)
      return null;

    let hashed_payload = jwt_token.split('.')[1];
    let payload        = atob(hashed_payload);

    return JSON.parse(payload);
  },
  is_authenticated() {
    let payload = this.payload();
    if (payload === null)
      return false;

    return (payload['user_id'] != null);
  }
}
