interface Payload {
  user_id: number,
  username: string,
  uid: number,
  exp: number,
}

class UserAuthenticationService {
  token: string | null = '';
  payload: Payload = {} as Payload;
  authenticated: boolean = false;

  constructor() {
    this.token         = this.readToken();
    this.payload       = this.readPayload();
    this.authenticated = this.isAuthenticated();
  }

  private isAuthenticated(): boolean {
    if (this.payload === {} as Payload) return false;

    return !!this.payload.user_id;
  }

  private readPayload(): Payload {
    if (this.token === null) return {} as Payload;

    let hashedPayload = this.token.split('.')[1];
    let payload       = atob(hashedPayload);

    return JSON.parse(payload);
  }

  private readToken(): string | null {
    let token = localStorage.getItem('token');

    return token;
  }
}

export default new UserAuthenticationService();
