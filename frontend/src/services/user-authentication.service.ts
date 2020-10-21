interface Payload {
  user_id: number,
  username: string,
  uid: number,
  exp: number,
}

class UserAuthenticationService {
  payload: Payload = {} as Payload;
  authenticated: boolean = false;

  constructor() {
    this.payload       = this.readPayload();
    this.authenticated = this.isAuthenticated();
  }

  private isAuthenticated(): boolean {
    if (this.payload === {} as Payload) return false;

    return this.payload.user_id !== null;
  }

  private readPayload(): Payload {
    let token = localStorage.getItem('token');
    if (token === null) return {} as Payload;

    let hashedPayload = token.split('.')[1];
    let payload       = atob(hashedPayload);

    return JSON.parse(payload);
  }
}

export default new UserAuthenticationService();
