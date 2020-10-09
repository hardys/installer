package machines

import (
	"bytes"
	"encoding/json"
	"text/template"

	"github.com/pkg/errors"
)

var userDataTmpl = template.Must(template.New("user-data").Parse(`
apiVersion: machineconfiguration.openshift.io/v1
kind: MachineConfig
metadata:
  creationTimestamp: null
  labels:
    machineconfiguration.openshift.io/role: {{.role}}
  name: {{.name}}
spec:
  config: {{.content}}
`))

func userDataMachineConfig(name string, role string, content []byte) ([]byte, error) {
	var ignData map[string]interface{}
	if err := json.Unmarshal(content, &ignData); err != nil {
		return nil, errors.Wrap(err, "failed to Unmarshal user-data as json")
	}
	// These fields are provided by the templated pointer ignition in the MCO
	// ref https://github.com/openshift/machine-config-operator/pull/1792
	ignData["ignition"].(map[string]interface{})["config"].(map[string]interface{})["merge"] = nil
	mcIgnData, err := json.Marshal(ignData)
	if err != nil {
		return nil, errors.Wrap(err, "failed to Marshal user-data json")
	}
	data := map[string]string{
		"name":    name,
		"role":    role,
		"content": string(mcIgnData),
	}
	buf := &bytes.Buffer{}
	if err := userDataTmpl.Execute(buf, data); err != nil {
		return nil, errors.Wrap(err, "failed to execute user-data template")
	}
	return buf.Bytes(), nil
}
