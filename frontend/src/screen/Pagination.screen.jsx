import React from "react";

function Pagination(props) {
  const { number, totalPages, first, last } = props.pagination;
  const handleClick = (p) => {
    props.setPage(p);
  };
  return (
    <nav aria-label="Page navigation example">
      <ul className="pagination">
        <li className={"page-item" + (first ? "disabled" : "")}>
          <a className="page-link" onClick={() => handleClick(0)}>
            ❮❮
          </a>
        </li>
        <li className={"page-item" + (first ? "disabled" : "")}>
          <a className="page-link" onClick={() => handleClick(number - 1)}>
            ❮
          </a>
        </li>
        {[...Array(5).keys()]
          .map((k) => k + number - 1)
          .filter((k) => k > 0 && k <= totalPages)
          .map((l) => {
            console.log(number + 1 === l);
            return (
              <li className={"page-item" + (number + 1 === l ? "active" : "")}>
                <button
                  className="page-link"
                  onClick={() => handleClick(l - 1)}
                >
                  {l}
                </button>
              </li>
            );
          })}
        <li className={"page-item" + (last ? "disabled" : "")}>
          <a className="page-link" onClick={() => handleClick(number + 1)}>
            ❯
          </a>
        </li>
        <li className={"page-item" + (last ? "disabled" : "")}>
          <a className="page-link" onClick={() => handleClick(totalPages - 1)}>
            ❯❯
          </a>
        </li>
      </ul>
    </nav>
  );
}

export default Pagination;
