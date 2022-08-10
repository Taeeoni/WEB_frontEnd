import React, { useEffect, useState } from "react";
import { Navigate, useLocation } from "react-router-dom";
import queryString from "query-string";
import Axios from "../Axios.js";
import { Container, Table, Toast, Button } from "react-bootstrap";
import { Link, useNavigate } from "react-router-dom";
import Comment from "./Comment.screen.js";
import { CKEditor } from "@ckeditor/ckeditor5-react";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";

CKEditor.editorConfig = function (config) {
  config.enterMode = CKEditor.ENTER_BR;
};

function One() {
  const navigate = useNavigate();
  const { search } = useLocation();
  const { id } = queryString.parse(search);
  const { modify } = queryString.parse(search);
  const [post, setPost] = useState([]); // post에 데이터가 저장 , setPost 통해 데이터가 변경

  const onChangeTitle = (e) => {
    console.log(e.target);
    console.log(e.target.value);
    setPost((prevState) => ({ ...prevState, title: e.target.value }));
  };

  useEffect(() => {
    console.log("111");
    Axios.get(`/postapi/home/findOne?id=${id}`)
      .then((res) => res.data)
      .then((data) => setPost(data));
  }, []);

  const update = async () => {
    await Axios.post(`postapi/home/revise`, null, {
      params: {
        id: id,
        title: post.title,
        content: post.content,
        views: post.views,
      },
    });

    navigate(`/Board`);
  };

  const deleteNotice = async () => {
    await Axios.post(`postapi/home/delete`, null, {
      params: {
        id: post.id,
      },
    });

    navigate(`/Board`);
  };

  console.log(post);

  return (
    <Container>
      <h1>게시판 글</h1>

      <Table striped bordered hover>
        <tr>
          <td width="100">번호</td>
          <td colspan="3">{post.id}</td>
        </tr>
        <tr>
          <td width="100">답글번호</td>
          <td colspan="3">{post.rootid}</td>
        </tr>
        <tr>
          <td width="100">답글순서</td>
          <td colspan="3">{post.recnt}</td>
        </tr>
        <tr>
          <td width="100">답글레벨</td>
          <td colspan="3">{post.relevel}</td>
        </tr>
        {modify == 0 ? (
          <tr>
            <td width="100">제목</td>
            <td colspan="3">
              <input type="text" name="title" value={post.title} readOnly />
            </td>
          </tr>
        ) : (
          <tr>
            <td width="100">제목</td>
            <td colspan="3">
              <input
                onChange={onChangeTitle}
                type="text"
                name="title"
                defaultvalue={post.title}
              />
            </td>
          </tr>
        )}

        <tr>
          <td width="100">조회수</td>
          <td colspan="3">{post.views}</td>
        </tr>
        <tr>
          <td width="100">등록일</td>
          <td colspan="3">{post.date}</td>
        </tr>
        {modify == 0 ? (
          <tr>
            <td width="100">내용</td>
            <td colspan="3">
              <div dangerouslySetInnerHTML={{ __html: post.content }}></div>
            </td>
          </tr>
        ) : (
          <tr>
            <td width="100">내용</td>
            <td colspan="3">
              <CKEditor
                editor={ClassicEditor}
                data={post.content}
                onReady={(editor) => {
                  console.log("Editor is ready to use!", editor);
                }}
                onChange={(event, editor) => {
                  const data = editor.getData();
                  setPost((prevState) => ({ ...prevState, content: data }));
                  console.log({ event, editor, data });
                }}
                onBlur={(event, editor) => {
                  console.log("Blur.", editor);
                }}
                onFocus={(event, editor) => {
                  console.log("Focus.", editor);
                }}
              />
              {/* <textarea
                onChange={onChange}
                name="content"
                cols="70"
                rows="15"
                defaultValue={post.content}
              >
                {content}
              </textarea> */}
            </td>
          </tr>
        )}
      </Table>
      <Table striped bordered hover>
        <tr>
          {modify == 0 ? (
            <td>
              <div>
                <Link to={`/One?id=${id}&modify=1`}>
                  <Button type="submit" variant="dark">
                    글 수정
                  </Button>
                </Link>
              </div>
            </td>
          ) : (
            <td>
              <div>
                <Button onClick={update} type="submit" variant="dark">
                  글 수정 완료
                </Button>
              </div>
            </td>
          )}

          <td>
            <div>
              <Button onClick={deleteNotice} type="submit" variant="dark">
                글 삭제
              </Button>
            </div>
          </td>
          <td>
            <Link to={`/Board`}>
              <Button type="submit" variant="dark">
                홈
              </Button>
            </Link>
          </td>
          <td>
            <Link to={`/AddRe?id=${id}`}>
              <Button type="submit" variant="dark">
                답글달기
              </Button>
            </Link>
          </td>
        </tr>
        {/* {file ? (
          <tr>
            <td>
              <a href={url} download>
                {file.name}
              </a>
            </td>
          </tr>
        ) : null}
        <tr>
          <React.Fragment>
            <Button onClick={handleButtonClick}>파일 업로드</Button>
            <input
              type="file"
              ref={fileInput}
              onChange={handleChange}
              style={{ display: "none" }}
            />
          </React.Fragment>
        </tr> */}
      </Table>

      <Comment />
    </Container>
  );
}

export default One;
