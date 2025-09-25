---
title: Documentation Build Failed
labels: documentation, bug
assignees: 
---

## Documentation Build Failure

The documentation build has failed. Please check the following:

### Build Information
- **Workflow**: Documentation
- **Branch**: {{ github.ref_name }}
- **Commit**: {{ github.sha }}
- **Run ID**: {{ github.run_id }}

### Common Issues to Check
- [ ] Duplicate route IDs in frontmatter
- [ ] Invalid API schema references
- [ ] Missing or broken image links
- [ ] Syntax errors in Markdown files
- [ ] Missing required frontmatter fields

### Next Steps
1. Review the workflow logs for specific error messages
2. Check the files mentioned in the error output
3. Fix any identified issues
4. Re-run the documentation build

### Workflow Logs
Please check the [workflow run]({{ github.server_url }}/{{ github.repository }}/actions/runs/{{ github.run_id }}) for detailed error information.

---
*This issue was automatically created by the documentation workflow.*
