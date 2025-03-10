/**
 * API Documentation Page
 * 
 * @category Pages
 * @package Conduction Docs
 * @author Claude AI
 * @copyright 2023 Conduction
 * @license EUPL-1.2
 * @version 1.0.0
 * @link https://conduction.nl
 */

import React from 'react';
import Layout from '@theme/Layout';
import { RedocStandalone } from 'redoc';

/**
 * API documentation page component
 * 
 * @returns {JSX.Element} The rendered API documentation page
 */
function ApiPage() {
  return (
    <Layout
      title="API Documentation"
      description="API Documentation"
    >
      <div style={{ height: 'calc(100vh - 60px)' }}>
        <RedocStandalone
          specUrl="/Softwarecatalogus/oas/gemma.yaml"
          options={{
            nativeScrollbars: true,
            theme: {
              colors: {
                primary: {
                  main: '#25c2a0'
                }
              },
              typography: {
                fontSize: '16px',
                lineHeight: '1.5em',
                fontFamily: 'system-ui, -apple-system, "Segoe UI", Roboto, Ubuntu, Cantarell, "Noto Sans", sans-serif',
                headings: {
                  fontFamily: 'system-ui, -apple-system, "Segoe UI", Roboto, Ubuntu, Cantarell, "Noto Sans", sans-serif',
                }
              }
            }
          }}
        />
      </div>
    </Layout>
  );
}

export default ApiPage; 