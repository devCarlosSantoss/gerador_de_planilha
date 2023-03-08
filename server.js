import express from 'express';
import multer from 'multer';
import fs from 'fs';
import Excel from 'excel4node';

const app = express();
const wb = new Excel.Workbook();

//Estilo de cabeçalho do excel
const styleHeader = wb.createStyle({
  font: {
    bold: true,
    color: 'black'
  },
  alignment: {
    horizontal: 'center',
    vertical: 'center'
  },
  fill: {
    type: 'pattern',
    patternType: 'solid',
    fgColor: '#d9e1f2'
  },
  border: {
    left: {
      style: 'thin',
      color: '#000000'
    },
    top: {
      style: 'thin',
      color: '#000000'
    },
    right: {
      style: 'thin',
      color: '#000000'
    },
    bottom: {
      style: 'thin',
      color: '#000000'
    }
  }
});

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/');
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  }
});

const upload = multer({
  storage: storage
});

app.use(express.static('public'));

app.post('/processar-arquivo', upload.single('arquivo'), async (req, res) => {
  const file = req.file;
  console.log(file);
  // res.send(file);

  if (!file) {
    return res.sendStatus(400);
  }

  // Ler o arquivo linha por linha com fs.createReadStream()
  const readStream = fs.createReadStream(file.path, {
    encoding: 'utf8'
  });

  // Criar uma string vazia que irá armazenar o conteúdo do arquivo
  let content = '';

  // Ler cada linha do arquivo e concatenar na string content
  readStream.on('data', (chunk) => {
    content += chunk;
  });

  // Quando a leitura do arquivo terminar, o evento 'end' será acionado
  readStream.on('end', () => {
    const lines = content.split('\n');

    const matchingLines = lines.filter((line) => {
      return line.includes('@Banco');
    });
    const step = lines.filter((line) => {
      return line.includes('Esquema do Cenario');
    })
    const list = matchingLines.map((el, index) => {
      const lista = el + ' | ' + step[index];
      return lista.trim();
    });



    console.log(list);

    // Criando um novo arquivo Excel
    const wb = new Excel.Workbook();

    // Adicionando uma nova planilha ao arquivo
    const cenarios = wb.addWorksheet('CENARIOS');
    // Formatando a primeira aba do excel
    cenarios.cell(1, 1).string('CÓDIGO DO PROJETO').style(styleHeader);
    cenarios.cell(1, 2).string('CENÁRIOS').style(styleHeader);
    cenarios.cell(1, 3).string('TESTER DESIGNER').style(styleHeader);
    cenarios.cell(1, 4).string('ANALISTA AV').style(styleHeader);
    cenarios.cell(1, 5).string('REVISÃO CT').style(styleHeader);
    cenarios.cell(1, 6).string('PRIORIDADE DE TESTE').style(styleHeader);
    cenarios.cell(1, 7).string('STATUS DA CORREÇÃO').style(styleHeader);



    // const defeitos = wb.addWorksheet('DEFEITOS');
    // const defeito_docs = wb.addWorksheet('Defeito_Documentacao');
    // const defeito_feature = wb.addWorksheet('Defeito_Feature');
    // Escrevendo os dados no arquivo Excel
    // matchingLines.forEach((line, index) => {
    //   cenarios.cell(index + 2, 2).string(line);
    // });

    list.forEach((line, index) => {
      cenarios.cell(index + 2, 2).string(Array.isArray(line) ? line.join('') : line);
    })

    // step.forEach((line, index) => {
    //   cenarios.cell(index + 2, 2).string(line);
    // })

    // Definindo o nome do arquivo
    const fileName = 'Planilha de defeitos.xlsx';

    // Escrevendo o arquivo Excel para o disco
    wb.write(fileName, (err, stats) => {
      if (err) {
        console.error(err);
        return res.sendStatus(500);
      }

      // Fazendo o download do arquivo
      res.download(fileName, (err) => {
        if (err) {
          console.error(err);
          return res.sendStatus(500);
        }

        // Removendo o arquivo do disco após o download
        fs.unlinkSync(fileName);
      });
    });
  });
});

app.listen(3000, () => {
  console.log('Servidor rodando em http://localhost:3000');
});