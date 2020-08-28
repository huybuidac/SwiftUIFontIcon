import css from 'css'
import fs from 'fs'

const handler = async () => {
    const text = await fs.readFileSync('./material_baseline.css', 'utf8')
    const obj = css.parse(text)
    let iconCodes = obj.stylesheet.rules.filter(r => r.declarations && r.declarations[0].property === 'content')
    let codeList = []
    let addUnderScore = [
        "360",
        "3d_rotation",
        "4k",
        "extension",
        "public",
        "repeat",
        "6_ft_apart",
        "5g",
        "class",
        "subscript"
    ]
    let result = iconCodes.reduce((prev, value) => {
        var codeName = value.selectors[0].replace('.md-', '').replace(':after', '').replace(':before', '')
        var codeName = addUnderScore.includes(codeName) ? `_${codeName}` : codeName
        if (codeList.includes(codeName)) {
            return prev
        } else {
            codeList.push(codeName)
            let codeValue = `${value.declarations[0].value.slice(2, -1)}`
            return prev + `case ${codeName} = "\\u{${codeValue}}"\n`
        }
    }, '')
    fs.writeFileSync('./mb.swift', result)
}

handler().then(() => {

})