import React, { useState } from 'react';
import axios from "axios";
import { useNavigate } from "react-router-dom";

function ShopForm(props) {

    //db명과 일치...멤버
    const [photo, setPhoto] = useState('');
    const [sangpum, setSangpum] = useState('');
    const [su, setSu] = useState('');
    const [dan, setDan] = useState('');

    //이동에 필요한 navigater
    const navi = useNavigate();

    //url등록
    let uploadUrl = "http://localhost:9000/shop/upload";//백엔드 주소
    let photoUrl = "http://localhost:9000/save/";
    let insertUrl = "http://localhost:9000/shop/insert";//insert url

    //file change시 호출 이벤트
    const uploadImage = (e) => {
        const uploadFile = e.target.files[0];
        const imageFile = new FormData();

        imageFile.append("uploadFile", uploadFile);

        axios({
            method: 'post',
            url: uploadUrl,
            data: imageFile,
            headers: { 'Content-Type': 'multipart/form-data' }
        }).then((res) => {
            setPhoto(res.data); // 백엔드에서 보낸 변경된 이미지명을 photo변수에
        }).catch((err) => {
            alert(err);
        });
    };


    //추가하는 함수 이벤트...추가 후 목록으로 이동
    const onInsert = () => {//이름 똑같으면 생략 sangpum:sangpum이렇게 해야하는데
        axios.post(insertUrl, { sangpum, su, dan })
            .then(res => {
                //인서트 성공 후 처리 할 코드 넣기
                //목록으로 이동
                navi("/shop/list");//페이지 달라서 초기화 안해도 됨
            });
    };

    return (
        <div>
            <table className="table table-bordered" style={{ width: "600px" }}>
                <caption>
                    <b>상품등록</b>
                </caption>
                <tbody>
                    <tr>
                        <th width="90" style={{ backgroundColor: "#ffc" }}>
                            상품명
                        </th>
                        <td width="300">
                            <input
                                type="text"
                                className="form-control"
                                style={{ width: "250px" }}
                                onChange={(e) => {
                                    setSangpum(e.target.value);
                                }}
                            />
                        </td>
                        <th>{sangpum}</th>
                    </tr>

                    <tr>
                        <th width="90" style={{ backgroundColor: "#ffc" }}>
                            상품사진
                        </th>
                        <td width="300">
                            <input
                                type="file"
                                className="form-control"
                                style={{ width: "200px" }}
                                onChange={uploadImage}
                            />
                        </td>
                    </tr>

                    <tr>
                        <th width="90" style={{ backgroundColor: "#ffc" }}> 단가</th>
                        <td width="300">
                            <input
                                type="text"
                                className="form-control"
                                style={{ width: "150px" }}
                                onChange={(e) => {
                                    setDan(e.target.value)
                                }}
                            />
                        </td>
                        <th>{dan}</th>
                    </tr>

                    <tr>
                        <th width="90" style={{ backgroundColor: "#ffc" }}>수량</th>
                        <td width="300">
                            <input
                                type="text"
                                className="form-control"
                                style={{ width: "150px" }}
                                onChange={(e) => {
                                    setSu(e.target.value)
                                }}
                            />
                        </td>
                        <th>{su}</th>
                    </tr>

                    <tr style={{ width: "160px" }}>
                        <td colSpan="2">
                            <img
                                src={photoUrl + photo}
                                style={{ width: "120px", marginLeft: "120px" }}
                            />
                        </td>

                        <td>
                            <button
                                type="button"
                                className="btn btn-info"
                                style={{ width: "120px", height: "120px", marginLeft: "30px" }}
                                onClick={onInsert}>상품등록
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    );
}
            

export default ShopForm;