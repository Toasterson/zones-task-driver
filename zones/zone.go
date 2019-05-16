package zone

import (
	"fmt"

	"git.wegmueller.it/illumos/go-zone/config"
	"github.com/hashicorp/nomad/plugins/drivers"
)

func (d *Driver) initializeContainer(cfg *drivers.TaskConfig, taskConfig TaskConfig) *config.Zone {

	containerName := fmt.Sprintf("%s-%s", cfg.Name, cfg.AllocID)
	z := config.New(containerName)
	z.Autoboot = false
	z.Brand = taskConfig.Brand
	z.Zonepath = fmt.Sprintf("%s/%s", taskConfig.Zonepath, containerName)

	return z

}
