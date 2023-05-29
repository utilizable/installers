# don't create terraform .state files
terraform {
  backend "inmem" {}
}

resource "null_resource" "main" { 
  # execute ansible 
  provisioner "local-exec"  {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ./ansible/inventory/inventory.yml ./ansible/playbooks/main.yml" 
    working_dir = "../${path.module}"
  }
}
