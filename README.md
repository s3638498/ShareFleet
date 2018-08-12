[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)

## Share Fleets Infrastructure

### AWS EC2: t2.micro 
> [sharefleets public DNS](http://ec2-54-66-162-34.ap-southeast-2.compute.amazonaws.com:3000)

> note:   
  Rails is running inside tmux on port 3000  
  to attach run `tmux attach`  
  to detach run `Ctrl + b` then `d`  
  
  
### IAC: Puppet
> [Puppet Console](https://ec2-13-237-72-77.ap-southeast-2.compute.amazonaws.com)

> note:   
  Puppet running on t2.medium, spin up when needed  
  if any reason need new instances to host Rails  
  login to console, add new node. On the agent node run `puppet agent --test`  
  This will install necessary dependencies to runs Ruby & ROR 

### Login Credentials (*Links will expired in 14 days*)

[AWS IAM](https://transfer.sh/6NltZ/cs-user.csv)  
> Full access to web console and aws cli to launch ec2

[AWS Private Key](https://transfer.sh/KLRql/share-fleets) *(bad practice for private key sharing, don't do this in real world)*
> Key to both server  
> After download run `chmod 600` to tighten up the permission

### AWS Route 53
* sharefleets domain (optional)
* pricing : A$12.00 - one year

### Logging & Monitoring
* Cloudwatch - monitoring
* Splunk - log forwarding service 
* Elastic Search, Logstash, Kibana also known as ELK stack ?

### CI/CD 
* CI Server: Buildkite - A Melbourne base company. Free trial for student

### Amazon Simple Email Service (SES)
* email:  booking, passcode and billing
