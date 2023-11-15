# Identity and Access Management (IAM)

**Overview**:
AWS Identity and Access Management (IAM) is a service that helps you securely control access to AWS resources. Here are some study notes on AWS IAM:

**Key Concepts:**
1. **Users:** End-users such as people, applications, or services that interact with AWS resources.
2. **Groups:** A collection of IAM users that have common permissions.
3. **Roles:** Temporary security credentials that can be assumed by trusted entities, such as AWS services, applications, or users.
4. **Policies:** JSON-formatted documents that define permissions and can be attached to users, groups, or roles.

**IAM Users and Groups:**
1. Users can have individual security credentials such as access keys, passwords, and multi-factor authentication devices.
2. Groups help to manage permissions for multiple users, making it easier to manage and scale permissions as your organization grows.

**IAM Policies:**
1. Policies are documents that define what actions are allowed or denied.
2. They can be inline policies (embedded directly into a user, group, or role) or managed policies (standalone policies that can be attached to multiple users, groups, or roles).
3. Common policy elements include Version, Statement, Effect, Action, Resource, and Condition.

**IAM Roles:**
1. Roles do not have long-term credentials like users.
2. They are assumed by trusted entities, which are then granted temporary security credentials to access AWS resources.
3. Common use cases include cross-account access, temporary access for users, and providing access to AWS services.

**Best Practices:**
1. Use Groups to manage permissions for users.
2. Grant least privilege - only give the permissions necessary to perform a task.
3. Regularly review and audit permissions.
4. Rotate security credentials regularly.
5. Enable multi-factor authentication for privileged users.

**Practricals:**
1. [**User Management:**](./1.user_management.md)
   - How to create and configure IAM users for individuals who need access to AWS resources.
   - How to assign permissions to users through policies.
2. [**Group Management:**](./2.group_management.md)
   - How to create IAM groups for organizing users with similar permissions.
   - How to attach managed policies to groups to easily assign permissions to multiple users.
3. [**Role Management:**](./3.roles_management.md)
   - How to create IAM roles for AWS services that require access to other resources.
4. [**Permissions and Policies:**](./4.permissions_and_policy.md)
   - How to write custom IAM policies to fine-tune permissions.
   - How to attach policies to users, groups, or roles to grant the necessary permissions.
