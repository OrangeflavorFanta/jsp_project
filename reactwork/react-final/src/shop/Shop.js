import React from "react";
import { useNavigate } from "react-router-dom";

function Shop(props) {
  const navi = useNavigate();
  return (
    <div>
      <button
        type="button"
        className="btn btn-info"
        onClick={() => navi("/shop/form")} // 상품 폼 페이지로 이동 
      >
        상품등록
      </button>
      <h1>상품 목록 출력</h1>
    </div>
  );
}

export default Shop;    