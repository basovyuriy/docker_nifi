import java.util.regex.Pattern

Map<String, String> generateFlumeConfig(Map<String, Object> config, String brokers, String nameService) {


config.agents.keySet().collectEntries

{

String agent ->
  String template = readFile "Flume/${agent}.tmpl"
  def requiredKeys = config.dfaults[agent].keySet()

  def envTemplate = template
    .replaceAll(Pattern.quote("[[agent]]"),agent)
    .replaceAll(Pattern.quote("[[nameService]]", nameService)
    .replaceAll(Pattern.quote("[[brokers]]"), brokers)

  def topics = config.agents[agent].keySet()

  String agentHead = "${agent}.sources=" + topics.collect { it + "_source" }.join (" ") + "\n"
  agentHead += "${agent}.channels=" + topics.collect { it + "_channel" }.join(" ") + "\n"
  agentHead += "${agent}.sinks=" + topics.collect { it + "_sink" } .join(" ") + "\n"

  def filledTemplates = topics.collect {
    String topic ->
      String topicTemplate = envTemplate

      (requiredKeys + "topic").each {

        key ->
	  def topicDescription = config.agents[agent][topic]

	  def setValue = (config.defaults[agent][key])?.replaceAll(Pattern.quote("[[topic]]"), topic)

	  if (topicDescription) {
	  setValue = topicDescription[key] ?: setValue
	  }

	  String keyVal = key == "topic" ? topic ; setValue

	  topicTemplate = topicTemplate.replaceAll(Pattern.quote("[[${key}]]", keyVal)
	  }
	  topicTemplate = topicTemplate.replaceAll("(?m)^.*=\\sEMPTY\\s*\n", "")

	  topicTemplate.replaceAll("(?m)^#\\s+.*\\n", "")

      }
}
[(agent): agentHead + filledTemplates.join("\n")]


}

}

return this







