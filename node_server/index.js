const express = require("express");

const app = express();

app.use(express.json());

app.use(express.urlencoded({
    extended: true
}));

const productData = [];

app.listen(2000, () => {
    console.log("connect successful at port 2000");
})

//post api
app.post("/api/add_product", (req, res) => {
    console.log("result", req.body);

    const pdata = {
        "id": productData.length + 1,
        "pname": req.body.pname,
        "pdescription": req.body.pdescription
    };
    productData.push(pdata);
    console.log("Final", pdata);
    res.status(200).send({
        "status_code": 200,
        "message": "successful",
        "product": pdata
    });
})

//get api
app.get("/api/get_product", (req, res) => {
    if(productData.length > 0) {
        res.status(200).send({
            'status_code': 200,
            'products': productData
        }); 
    } else {
        res.status(200).send({
            'status_code': 200,
            'products': []
        });
    }
})