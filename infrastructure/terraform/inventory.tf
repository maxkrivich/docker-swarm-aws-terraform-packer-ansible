# generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/templates/hosts.tpl",
    {
      swarm_masters = aws_instance.swarm_manager.*.public_ip
      swarm_workers = aws_instance.swarm_worker.*.public_ip
    }
  )
  filename = "../ansible/inventory/hosts"
}
