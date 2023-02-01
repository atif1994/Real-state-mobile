import 'package:get/get.dart';
import 'package:prologic_29/data/Models/agent_model/assign_agents_response.dart';
import 'package:prologic_29/data/Models/agent_model/get_agent_model.dart';
import 'package:prologic_29/data/Services/agent_services/assign_agents_service.dart';
import 'package:prologic_29/data/Services/agent_services/get_agent_services.dart';

class AgentController extends GetxController {
  RxBool loadingAgent = false.obs;
  RxString errorLoadingAgent = ''.obs;
  int propId = 0;
  var agentModel = GetAgentResponse();

  List<Agents> agents = [];

  void getAgent(int pid) async {
    errorLoadingAgent.value = '';
    loadingAgent.value = true;

    var res = await AgentPropertise.getAgents(pid);
    loadingAgent.value = false;
    if (res is GetAgentResponse) {
      agentModel = res;
    } else {
      errorLoadingAgent.value = res.toString();
      loadingAgent.value = false;
    }
  }

  /////////////////////assign agents
  RxBool loadingAssingerdAgent = false.obs;
  RxString errorAssingningAgents = ''.obs;
  RxInt agentsIndex = 0.obs;

  var assignAgentsModel = AssignAgentResponse();
  void assignAgents() async {
    errorAssingningAgents.value = '';
    loadingAgent.value = true;

    var res = await AssignAgentService.assignAgents(propId, agents);
    loadingAgent.value = false;
    if (res is GetAgentResponse) {
      agentModel = res;
    } else {
      errorLoadingAgent.value = res.toString();
      loadingAgent.value = false;
    }
  }

  void addAgent(int index, String agentId) {
    agents[index].agentId = agentId;
  }
}

class Agents {
  String? agentId;
  Agents({this.agentId});
}
