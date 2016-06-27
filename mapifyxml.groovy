def groovyUtils = new com.eviware.soapui.support.GroovyUtils( context )
def holder = groovyUtils.getXmlHolder( "" )
holder.namespaces["ns"] = "http://github.com/sand-bird/toys/"

def map = [:]


def mapifyXml = { nodelist, container ->
	nodelist.each {
    if (it.hasChildNodes()) {
			childMap = false
			it.getChildNodes().each { if (it.hasChildNodes()) childMap = true }
			
			if (childMap) {
				def newContainer = [:]
				owner.call(it.getChildNodes(), newContainer)
				if (!container.containsKey(it.localName)) {
					container[it.localName] = newContainer
				}
				else if (container[it.localName] instanceof List) {
					container[it.localName].push newContainer
				}
				else {
					def newList = []
					newList.push container[it.localName]
					newList.push newContainer
					container[it.localName] = newList
				}
			}
			else {
				owner.call(it.getChildNodes(), container)
			}
		}
		else if (it.hasProperty('nodeValue') && it.nodeValue && it.nodeValue.trim() != "") {
			container[it.getParentNode().localName] = it.nodeValue
		}
	}
}


for( item in holder.getDomNodes( "//ns:items" ) ) {
	mapifyXml (item, map)
}
