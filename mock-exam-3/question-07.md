# Question
Taint the worker node node01 to be Unschedulable. Once done, create a pod called dev-redis, image redis:alpine, to ensure workloads are not scheduled to this worker node. Finally, create a new pod called prod-redis and image: redis:alpine with toleration to be scheduled on node01.


key: env_type, value: production, operator: Equal and effect: NoSchedule

- [ ] key = env_type
- [ ] value = production
- [ ] effect = NoSchedule
- [ ] Is pod 'dev-redis' (no tolerations) not scheduled on node01?
- [ ] Is the 'prod-redis' to running on node01?