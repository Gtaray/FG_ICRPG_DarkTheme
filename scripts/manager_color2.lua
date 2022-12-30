
function onInit()
    ActorHealthManager.registerStatusHealthColor(ActorHealthManager.STATUS_UNCONSCIOUS, "1e1e1e");
    ActorHealthManager.registerStatusHealthColor(ActorHealthManager.STATUS_DYING, "1e1e1e");
    ActorHealthManager.registerStatusHealthColor(ActorHealthManager.STATUS_DEAD, "1e1e1e");

    ActorHealthManager.registerStatusHealthColor(ActorHealthManager.STATUS_HEALTHY, "57a64a");
    ActorHealthManager.registerStatusHealthColor(ActorHealthManager.STATUS_LIGHT, "b8d7a3");
    ActorHealthManager.registerStatusHealthColor(ActorHealthManager.STATUS_MODERATE, "dcdcaa");
    ActorHealthManager.registerStatusHealthColor(ActorHealthManager.STATUS_HEAVY, "e67140");
    ActorHealthManager.registerStatusHealthColor(ActorHealthManager.STATUS_CRITICAL, "f15151");

    ActorHealthManager.registerStatusHealthColor(ActorHealthManager.STATUS_SIMPLE_WOUNDED, "b8d7a3");
end