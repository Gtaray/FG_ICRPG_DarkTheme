
function onInit()
    HealthManager.registerStatusHealthColor(HealthManager.STATUS_UNCONSCIOUS, "1e1e1e");
    HealthManager.registerStatusHealthColor(HealthManager.STATUS_DYING, "1e1e1e");
    HealthManager.registerStatusHealthColor(HealthManager.STATUS_DEAD, "1e1e1e");

    HealthManager.registerStatusHealthColor(HealthManager.STATUS_HEALTHY, "57a64a");
    HealthManager.registerStatusHealthColor(HealthManager.STATUS_LIGHT, "b8d7a3");
    HealthManager.registerStatusHealthColor(HealthManager.STATUS_MODERATE, "dcdcaa");
    HealthManager.registerStatusHealthColor(HealthManager.STATUS_HEAVY, "e67140");
    HealthManager.registerStatusHealthColor(HealthManager.STATUS_CRITICAL, "f15151");

    HealthManager.registerStatusHealthColor(HealthManager.STATUS_SIMPLE_WOUNDED, "b8d7a3");
end