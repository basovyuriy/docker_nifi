/* FLUME config generator */
if (newFiles.any { file -> file.endsWith("Flume/config.yml")
}
|| newFiles.any { file -> file.contains("Flume/") && file.endsWith(".tmpl") }) {
  def envs = readYaml file: "Flume/env.yml"
  def yaml = readYaml file: "Flume/config.yml"
  def flumeGenerator = load "Jenkins/lib/flume-generator.groovy"

  envs.each { env ->
    def envName = env.key
    def brokers = env.value.brokers
    def nameService = env.value.nameService
    def flumeConfigMap = flimeGenerator.generateFlumeConfig(yaml, brokers, nameService)

    flumeConfigMap.each {
      agent ->
        def agentName = agent.key
	def filename = "Flume/${envName}/${agentName}.properties"
	writeFile file: filename, text: agent.value
	changedFiles += filename.toString()
	}
	}
	}
	changedFiles = changedFiles.findAll {file-> !(file.confatins("Flume/") && (file.endsWith("yml") || file.endsWith("tmpl"))) }
	// FLUME config end
