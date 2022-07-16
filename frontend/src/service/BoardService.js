import Axios from "../Axios";

class BoardService {
  findAll(page = 0, size = 10) {
    return Axios.get(
      `/postapi/home?page=${page}&size=${size}&sort=id,desc`
    ).then((res) => res.data);
  }
}

export default new BoardService();
