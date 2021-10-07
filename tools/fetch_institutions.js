import fetch from 'node-fetch';
import fs from 'fs'
import jsdom from 'jsdom'
const {JSDOM} = jsdom;





// let i=1;
// const max = 316;
// let learningInst = [];

// for(i;i<=max;){
//  let result = await fetch(`https://listainstitutii.ro/tip/unitati-invatamant?act=1&judet=asc&pag=${i}`).then(result=>result.text()).then(html=>{
//     // console.log(html)
//     const jsDom = new JSDOM(html)
//      jsDom.window.document.querySelectorAll('tbody tr').forEach((row, i)=>{i> 0 ?learningInst.push({location:row.querySelectorAll('td')[1].textContent , name: row.querySelectorAll('td')[0].textContent}) : null;});
//      console.log(i, learningInst)
//      ++i;
//  });
// }

// console.log(learningInst)
// fs.writeFileSync('./institutions.json', JSON.stringify(learningInst))

// const fileContent = fs.readFileSync('./institutions.json')
// const institutions = JSON.parse(fileContent)
// console.log('number of institutions:', institutions.length)