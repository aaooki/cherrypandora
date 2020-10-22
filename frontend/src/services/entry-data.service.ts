import axios from "axios";

const http = axios.create({
  baseURL: '/api',
  responseType: 'json',
  headers: { 'Content-Type': 'application/json' }
});

class EntryDataService {
  async getAll(token: string): Promise<{}> {
    const response = await http.get(
      '/tracker',
      { headers: { 'Authorization': `Bearer ${token}` } }
    );

    const {data} = response;

    return data;
  }

  async create(length: number, token: string): Promise<{}> {
    const response = await http.post(
      '/entry',
      { length: length },
      { headers: { 'Authorization': `Bearer ${token}` } }
    );

    return response;
  }
}

export default new EntryDataService();
