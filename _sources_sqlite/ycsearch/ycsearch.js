let url = 'https://api.youcontrol.world/Entity/search'

const response = await fetch(url)
const json = await response.json()
const data = json.results

export { data }