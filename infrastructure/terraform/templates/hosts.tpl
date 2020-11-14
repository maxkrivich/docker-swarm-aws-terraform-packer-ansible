[swarm_master_hosts]
%{ for ip in swarm_masters ~}
${ip}
%{ endfor ~}

[swarm_worker_hosts]
%{ for ip in swarm_workers ~}
${ip}
%{ endfor ~}
