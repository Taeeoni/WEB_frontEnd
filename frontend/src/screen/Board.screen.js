import axios from "axios";
import { Container, Table, Button } from "react-bootstrap";
import React, { useEffect, useState } from "react";
import BoardService from "../service/BoardService";
import Pagination from "./Pagination.screen";

import { Link } from "react-router-dom";

//useState : 저장소를 만드는 것
function Board() {
  const [post, setPost] = useState([]); // post에 데이터가 저장 , setPost 통해 데이터가 변경
  const [pagination, setPagination] = useState({});
  const [page, setPage] = useState(0);

  useEffect(() => {
    BoardService.findAll(page, 10).then((res) => {
      console.log(res);
      setPost(res.content); // list 로 넘어오기 때문에 .content 가 필요없다.
      setPagination({
        number: res.number,
        totalPages: res.totalPages,
        first: res.first,
        last: res.last,
      });
    });
  }, [page]);

  return (
    <Container>
      <h1>Post</h1>

      <Table striped bordered hover>
        <thead>
          <tr>
            <th width="70">번호</th>
            <th width="400">제목</th>
            <th width="70">조회수</th>
            <th width="100">등록일</th>
          </tr>
        </thead>
        <tbody>
          {post.map((p) => {
            return (
              <tr>
                <td>{p.id}</td>
                <td>
                  <Link to={`/One?id=${p.id}&modify=0`}>
                    {p.title}&nbsp;[{p.noticeComments.length}]
                  </Link>
                </td>
                <td>{p.views}</td>
                <td>{p.date}</td>
              </tr>
            );
          })}
        </tbody>
      </Table>
      <div className="d-flex justify-content-center">
        <Pagination pagination={pagination} setPage={(p) => setPage(p)} />
      </div>
      <Link to={`/Add`}>
        <Button type="submit" variant="dark">
          추가
        </Button>
      </Link>
    </Container>
  );
}

export default Board;
