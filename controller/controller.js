const prisma = require("../lib/prisma");

class controller {
  async getApi(req, res) {
    await prisma.shirt
      .findMany({
        orderBy: {
          id: "asc",
        },
      })
      .then((data) => {
        res.json(data);
      })
      .catch((err) => {
        res.json(err);
      });
  }

  async getOneApi(req, res) {
    await prisma.shirt
      .findUnique({
        where: {
          id: Number(req.params.id),
        },
        select: {
          name: true,
          img: true,
        },
      })
      .then((data) => res.json(data))
      .catch((err) => res.json(err));
  }

  async postApi(req, res) {
    if (!req.body.name) res.json({ message: "Shirt name is not found!!!" });
    await prisma.shirt
      .create({
        data: {
          name: req.body.name,
          img: req.body.img,
        },
      })
      .then((data) => {
        res.json(data);
      })
      .catch((err) => {
        res.json(err);
      });     
  }

  async updateApi(req, res) {
    await prisma.shirt
      .update({
        where: {
          id: Number(req.params.id),
        },
        data: {
          name: req.body.name,
          img: req.body.img,
        },
        select: {
          name: true,
        },
      })
      .then((data) => res.json(data))
      .catch((err) => res.json(err));
  }
  async deleteApi(req, res){
    await prisma.shirt.delete({
      where: {
        id: Number(req.params.id)
      }
    })
    .then(data => res.json(data))
    .catch(err => res.json(err))
  }
}

module.exports = new controller();
